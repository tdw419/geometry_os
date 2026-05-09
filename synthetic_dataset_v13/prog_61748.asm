; DESCRIPTION: Places a cyan 20x116 rectangle at position (352, 63).
; PLAN: r0=352(x), r1=63(y), r2=20(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 63
LDI r2, 20
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
