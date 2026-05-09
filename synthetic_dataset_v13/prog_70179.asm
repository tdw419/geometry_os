; DESCRIPTION: Places a white 73x91 rectangle at position (294, 9).
; PLAN: r0=294(x), r1=9(y), r2=73(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 9
LDI r2, 73
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
