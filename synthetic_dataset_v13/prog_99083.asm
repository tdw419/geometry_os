; DESCRIPTION: Places a cyan 68x120 rectangle at position (368, 50).
; PLAN: r0=368(x), r1=50(y), r2=68(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 50
LDI r2, 68
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
