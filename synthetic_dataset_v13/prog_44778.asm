; DESCRIPTION: Places a cyan 102x54 rectangle at position (285, 182).
; PLAN: r0=285(x), r1=182(y), r2=102(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 182
LDI r2, 102
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
