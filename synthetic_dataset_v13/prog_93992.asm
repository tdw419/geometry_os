; DESCRIPTION: Renders a cyan box of size 70x98 starting at (298, 132).
; PLAN: r0=298(x), r1=132(y), r2=70(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 132
LDI r2, 70
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
