; DESCRIPTION: Composite: Places a cyan dot at position (296, 54) then Places a red 120x30 rectangle at position (242, 210).
; PLAN: r0=296(x), r1=54(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=210(y), r7=120(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 54
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 210
LDI r7, 120
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
