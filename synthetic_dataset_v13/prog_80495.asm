; DESCRIPTION: Renders a magenta box of size 70x109 starting at (297, 46).
; PLAN: r0=297(x), r1=46(y), r2=70(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 46
LDI r2, 70
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
