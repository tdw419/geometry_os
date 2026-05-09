; DESCRIPTION: Places a cyan 102x80 rectangle at position (367, 95).
; PLAN: r0=367(x), r1=95(y), r2=102(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 95
LDI r2, 102
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
