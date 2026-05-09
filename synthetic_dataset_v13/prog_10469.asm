; DESCRIPTION: Renders a cyan box of size 17x62 starting at (439, 125).
; PLAN: r0=439(x), r1=125(y), r2=17(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 125
LDI r2, 17
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
