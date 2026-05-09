; DESCRIPTION: Places a white 48x23 rectangle at position (237, 91).
; PLAN: r0=237(x), r1=91(y), r2=48(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 91
LDI r2, 48
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
