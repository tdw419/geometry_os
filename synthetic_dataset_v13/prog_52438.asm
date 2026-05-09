; DESCRIPTION: Places a cyan 73x42 rectangle at position (202, 214).
; PLAN: r0=202(x), r1=214(y), r2=73(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 214
LDI r2, 73
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
