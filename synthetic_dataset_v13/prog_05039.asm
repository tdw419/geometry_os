; DESCRIPTION: Places a cyan 40x86 rectangle at position (272, 36).
; PLAN: r0=272(x), r1=36(y), r2=40(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 36
LDI r2, 40
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
