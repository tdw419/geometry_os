; DESCRIPTION: Places a cyan 27x23 rectangle at position (374, 125).
; PLAN: r0=374(x), r1=125(y), r2=27(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 125
LDI r2, 27
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
