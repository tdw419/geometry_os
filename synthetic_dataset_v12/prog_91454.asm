; DESCRIPTION: Places a cyan 30x107 rectangle at position (243, 147).
; PLAN: r0=243(x), r1=147(y), r2=30(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 147
LDI r2, 30
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
