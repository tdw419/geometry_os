; DESCRIPTION: Places a white 92x31 rectangle at position (229, 125).
; PLAN: r0=229(x), r1=125(y), r2=92(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 125
LDI r2, 92
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
