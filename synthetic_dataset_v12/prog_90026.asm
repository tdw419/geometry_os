; DESCRIPTION: Places a white 22x21 rectangle at position (172, 177).
; PLAN: r0=172(x), r1=177(y), r2=22(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 177
LDI r2, 22
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
