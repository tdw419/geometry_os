; DESCRIPTION: Places a cyan 82x117 rectangle at position (401, 64).
; PLAN: r0=401(x), r1=64(y), r2=82(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 64
LDI r2, 82
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
