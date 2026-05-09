; DESCRIPTION: Places a white 24x102 rectangle at position (239, 91).
; PLAN: r0=239(x), r1=91(y), r2=24(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 91
LDI r2, 24
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
