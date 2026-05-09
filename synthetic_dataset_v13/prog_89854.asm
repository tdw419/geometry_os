; DESCRIPTION: Places a magenta 39x109 rectangle at position (193, 7).
; PLAN: r0=193(x), r1=7(y), r2=39(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 7
LDI r2, 39
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
