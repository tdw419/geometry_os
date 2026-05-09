; DESCRIPTION: Renders a cyan box of size 57x18 starting at (441, 226).
; PLAN: r0=441(x), r1=226(y), r2=57(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 226
LDI r2, 57
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
