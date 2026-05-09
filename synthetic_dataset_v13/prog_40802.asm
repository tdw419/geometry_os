; DESCRIPTION: Renders a yellow box of size 111x79 starting at (367, 98).
; PLAN: r0=367(x), r1=98(y), r2=111(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 98
LDI r2, 111
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
