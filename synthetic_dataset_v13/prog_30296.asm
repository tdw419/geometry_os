; DESCRIPTION: Renders a cyan box of size 23x18 starting at (398, 115).
; PLAN: r0=398(x), r1=115(y), r2=23(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 115
LDI r2, 23
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
