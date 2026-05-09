; DESCRIPTION: Composite: Places a green dot at position (346, 215) then Places a white 25x60 rectangle at position (189, 190).
; PLAN: r0=346(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=190(y), r7=25(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 189
LDI r6, 190
LDI r7, 25
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
