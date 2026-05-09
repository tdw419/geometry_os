; DESCRIPTION: Places a cyan 71x27 rectangle at position (48, 171).
; PLAN: r0=48(x), r1=171(y), r2=71(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 171
LDI r2, 71
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
