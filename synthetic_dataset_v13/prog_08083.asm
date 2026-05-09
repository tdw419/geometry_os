; DESCRIPTION: Places a cyan 59x11 rectangle at position (249, 125).
; PLAN: r0=249(x), r1=125(y), r2=59(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 125
LDI r2, 59
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
