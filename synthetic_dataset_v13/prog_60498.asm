; DESCRIPTION: Places a cyan 109x21 rectangle at position (197, 206).
; PLAN: r0=197(x), r1=206(y), r2=109(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 206
LDI r2, 109
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
