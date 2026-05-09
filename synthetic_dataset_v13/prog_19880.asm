; DESCRIPTION: Renders a purple box of size 46x11 starting at (305, 240).
; PLAN: r0=305(x), r1=240(y), r2=46(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 240
LDI r2, 46
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
