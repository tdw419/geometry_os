; DESCRIPTION: Places a green 107x34 rectangle at position (236, 211).
; PLAN: r0=236(x), r1=211(y), r2=107(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 211
LDI r2, 107
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
