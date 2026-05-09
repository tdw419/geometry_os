; DESCRIPTION: Places a magenta 107x109 rectangle at position (243, 69).
; PLAN: r0=243(x), r1=69(y), r2=107(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 69
LDI r2, 107
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
