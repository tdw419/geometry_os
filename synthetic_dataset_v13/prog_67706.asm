; DESCRIPTION: Places a cyan 89x91 rectangle at position (391, 83).
; PLAN: r0=391(x), r1=83(y), r2=89(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 83
LDI r2, 89
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
