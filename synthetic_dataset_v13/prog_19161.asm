; DESCRIPTION: Renders a cyan box of size 111x65 starting at (367, 185).
; PLAN: r0=367(x), r1=185(y), r2=111(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 185
LDI r2, 111
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
