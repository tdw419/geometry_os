; DESCRIPTION: Places a white 22x111 rectangle at position (208, 66).
; PLAN: r0=208(x), r1=66(y), r2=22(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 66
LDI r2, 22
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
