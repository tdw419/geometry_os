; DESCRIPTION: Renders a cyan box of size 33x86 starting at (475, 110).
; PLAN: r0=475(x), r1=110(y), r2=33(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 110
LDI r2, 33
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
