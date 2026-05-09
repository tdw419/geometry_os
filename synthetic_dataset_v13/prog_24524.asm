; DESCRIPTION: Places a cyan 57x111 rectangle at position (438, 54).
; PLAN: r0=438(x), r1=54(y), r2=57(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 54
LDI r2, 57
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
