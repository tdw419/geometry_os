; DESCRIPTION: Places a cyan 113x62 rectangle at position (259, 125).
; PLAN: r0=259(x), r1=125(y), r2=113(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 125
LDI r2, 113
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
