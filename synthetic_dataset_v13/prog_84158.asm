; DESCRIPTION: Renders a green box of size 111x55 starting at (321, 171).
; PLAN: r0=321(x), r1=171(y), r2=111(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 171
LDI r2, 111
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
