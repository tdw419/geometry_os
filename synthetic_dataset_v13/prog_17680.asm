; DESCRIPTION: Renders a cyan box of size 97x65 starting at (331, 186).
; PLAN: r0=331(x), r1=186(y), r2=97(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 186
LDI r2, 97
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
