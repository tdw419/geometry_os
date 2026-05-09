; DESCRIPTION: Renders a cyan box of size 40x90 starting at (258, 115).
; PLAN: r0=258(x), r1=115(y), r2=40(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 115
LDI r2, 40
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
