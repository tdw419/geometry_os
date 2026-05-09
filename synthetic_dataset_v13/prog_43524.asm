; DESCRIPTION: Renders a cyan box of size 44x76 starting at (248, 124).
; PLAN: r0=248(x), r1=124(y), r2=44(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 124
LDI r2, 44
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
