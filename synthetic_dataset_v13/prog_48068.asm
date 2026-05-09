; DESCRIPTION: Renders a cyan box of size 112x97 starting at (273, 61).
; PLAN: r0=273(x), r1=61(y), r2=112(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 61
LDI r2, 112
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
