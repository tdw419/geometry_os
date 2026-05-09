; DESCRIPTION: Composite: Places a red dot at position (321, 67) then Places a cyan 19x42 rectangle at position (308, 192).
; PLAN: r0=321(x), r1=67(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=192(y), r7=19(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 67
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 308
LDI r6, 192
LDI r7, 19
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
