; DESCRIPTION: Places a cyan 73x86 rectangle at position (350, 52).
; PLAN: r0=350(x), r1=52(y), r2=73(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 52
LDI r2, 73
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
