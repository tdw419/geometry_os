; DESCRIPTION: Places a cyan 61x14 rectangle at position (198, 168).
; PLAN: r0=198(x), r1=168(y), r2=61(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 168
LDI r2, 61
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
