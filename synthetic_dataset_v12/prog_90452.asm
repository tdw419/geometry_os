; DESCRIPTION: Places a cyan 120x113 rectangle at position (225, 141).
; PLAN: r0=225(x), r1=141(y), r2=120(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 141
LDI r2, 120
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
