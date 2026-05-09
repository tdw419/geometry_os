; DESCRIPTION: Places a cyan 14x112 rectangle at position (353, 86).
; PLAN: r0=353(x), r1=86(y), r2=14(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 86
LDI r2, 14
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
