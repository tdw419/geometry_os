; DESCRIPTION: Places a cyan 38x86 rectangle at position (28, 45).
; PLAN: r0=28(x), r1=45(y), r2=38(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 45
LDI r2, 38
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
