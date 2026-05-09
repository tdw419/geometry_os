; DESCRIPTION: Renders a magenta box of size 47x65 starting at (275, 175).
; PLAN: r0=275(x), r1=175(y), r2=47(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 175
LDI r2, 47
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
