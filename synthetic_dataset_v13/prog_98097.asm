; DESCRIPTION: Places a cyan 113x60 rectangle at position (187, 157).
; PLAN: r0=187(x), r1=157(y), r2=113(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 157
LDI r2, 113
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
