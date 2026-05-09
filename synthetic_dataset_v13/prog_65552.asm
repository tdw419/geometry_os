; DESCRIPTION: Places a cyan 68x34 rectangle at position (46, 95).
; PLAN: r0=46(x), r1=95(y), r2=68(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 95
LDI r2, 68
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
