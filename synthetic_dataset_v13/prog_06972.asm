; DESCRIPTION: Places a cyan 107x61 rectangle at position (264, 187).
; PLAN: r0=264(x), r1=187(y), r2=107(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 187
LDI r2, 107
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
