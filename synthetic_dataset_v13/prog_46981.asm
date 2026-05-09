; DESCRIPTION: Places a cyan 38x74 rectangle at position (292, 143).
; PLAN: r0=292(x), r1=143(y), r2=38(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 143
LDI r2, 38
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
