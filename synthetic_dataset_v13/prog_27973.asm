; DESCRIPTION: Renders a cyan box of size 89x70 starting at (368, 125).
; PLAN: r0=368(x), r1=125(y), r2=89(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 125
LDI r2, 89
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
