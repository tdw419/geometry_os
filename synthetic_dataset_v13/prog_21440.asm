; DESCRIPTION: Draws a cyan rectangle at (429, 152) with width 32 and height 77.
; PLAN: r0=429(x), r1=152(y), r2=32(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 152
LDI r2, 32
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
