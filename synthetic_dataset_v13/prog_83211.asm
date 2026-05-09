; DESCRIPTION: Renders a cyan box of size 115x44 starting at (370, 14).
; PLAN: r0=370(x), r1=14(y), r2=115(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 14
LDI r2, 115
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
