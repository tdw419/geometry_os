; DESCRIPTION: Renders a cyan box of size 19x33 starting at (406, 57).
; PLAN: r0=406(x), r1=57(y), r2=19(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 57
LDI r2, 19
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
