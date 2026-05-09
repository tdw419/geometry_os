; DESCRIPTION: Places a cyan 17x27 rectangle at position (197, 112).
; PLAN: r0=197(x), r1=112(y), r2=17(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 112
LDI r2, 17
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
