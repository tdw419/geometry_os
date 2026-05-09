; DESCRIPTION: Places a black 38x16 rectangle at position (202, 231).
; PLAN: r0=202(x), r1=231(y), r2=38(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 231
LDI r2, 38
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
