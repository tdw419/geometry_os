; DESCRIPTION: Draws a cyan rectangle at (228, 152) with width 89 and height 51.
; PLAN: r0=228(x), r1=152(y), r2=89(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 152
LDI r2, 89
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
